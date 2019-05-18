require "csv"
require "zlib"

require_relative "dataset"

module Datasets
  class KDDCup < Dataset
    Record = Struct.new(
      :duration,
      :protocol_type,
      :service,
      :flag,
      :src_bytes,
      :dst_bytes,
      :land,
      :wrong_fragment,
      :urgent,
      :hot,
      :num_failed_logins,
      :logged_in,
      :num_compromised,
      :root_shell,
      :su_attempted,
      :num_root,
      :num_file_creations,
      :num_shells,
      :num_access_files,
      :num_outbound_cmds,
      :is_host_login,
      :is_guest_login,
      :count,
      :srv_count,
      :serror_rate,
      :srv_serror_rate,
      :rerror_rate,
      :srv_rerror_rate,
      :same_srv_rate,
      :diff_srv_rate,
      :srv_diff_host_rate,
      :dst_host_count,
      :dst_host_srv_count,
      :dst_host_same_srv_rate,
      :dst_host_diff_srv_rate,
      :dst_host_same_src_port_rate,
      :dst_host_srv_diff_host_rate,
      :dst_host_serror_rate,
      :dst_host_srv_serror_rate,
      :dst_host_rerror_rate,
      :dst_host_srv_rerror_rate
    )

    def initialize
      super()
      @metadata.id = "kddcup"
      @metadata.name = ""
      @metadata.url = "http://kdd.ics.uci.edu/databases/kddcup99/"
      @metadata.description = lambda do
        read_description
#        read_names
      end
    end

    def each
      return to_enum(__method__) unless block_given?

      open_data do |csv|
        csv.each do |row|
          next if row[0].nil?
          record = Record.new(*row)
          yield(record)
        end
      end
    end

    private
    def open_data
      base_name = cache_dir_path + "kddcup.data.gz"
      data_path = cache_dir_path + base_name
      unless data_path.exist?
        data_url = "http://kdd.ics.uci.edu/databases/kddcup99/kddcup.data.gz"
        download(data_path, data_url)
      end
      Zlib::GzipReader.open(data_path) do |gz|
        yield(gz)
      end
    end

    def read_names
      # Unused yet
      names_path = cache_dir_path + "kddcup.names"
      unless names_path.exist?
        names_url = "http://kdd.ics.uci.edu/databases/kddcup99/kddcup.names"
        download(names_path, names_url)
      end
      names_path.read
    end

    def read_description
      description_path = cache_dir_path + "task.html"
      unless description_path.exist?
        description_url = "http://kdd.ics.uci.edu/databases/kddcup99/task.html"
        download(description_path, description_url)
      end
      description_path.read
    end
  end
end
