# Standard library dependencies.
require 'zlib'

# Third-party dependencies.
require 'bindata'

module Evtx
  # The file header provides overall information about an event log file.
  class FileHeader < BinData::Record
    string    :magic,  :length => 8
    uint64le  :oldest_chunk
    uint64le  :current_chunk_num
    uint64le  :next_record_num
    uint32le  :header_part1len
    uint16le  :minor_version
    uint16le  :major_version
    uint16le  :header_size
    uint16le  :chunk_count
    string    :unused1, :length => 76
    uint32le  :flags
    uint32le  :checksum

    attr_accessor :buffer

    private

    # Check that first eight bytes of the FileHeader match the
    # expected magic value.
    #
    # @return [Boolean]
    def check_magic
      self.magic == "ElfFile\x00"
    end # def check_magic

    public(:check_magic)
  end # class FileHeader
end # module Evtx
