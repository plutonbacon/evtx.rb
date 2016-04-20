# Third-party dependencies.
require 'bindata'

module Evtx
  # The file header provides some basic information about an event log file:
  #
  #   - the number of chunks
  #   - the chunk current in use
  #   - etc.
  #
  # While the header consists of 4096 bytes (1 page), only 128 bytes are
  # in use. Additionally, the header's integrity is protected by a
  # 32 bit checksum.
  class FileHeader < BinData::Record
    # "ElfFile\x00"
    string    :signature, length: 8

    uint64le  :first_chunk_number
    uint64le  :last_chunk_number
    uint64le  :next_record_identifier
    uint32le  :header_size
    uint16le  :minor_version
    uint16le  :major_version
    uint16le  :header_block_size
    uint16le  :number_of_chunks
    string    :unknown, length: 76

    # "0x0001 - Dirty || 0x0002 - Full"
    uint32le  :flags

    # "CRC32 of the first 120 bytes of the file header"
    uint32le  :checksum

    private

    # Check that first eight bytes of the FileHeader match the
    # expected signature.
    #
    # @return [Boolean]
    def check_signature
      signature == "ElfFile\x00"
    end # def check_signature

    def check_major_version
      major_version == 0x3
    end # def check_major_version

    def check_minor_version
      minor_version == 0x1
    end # def check_minor_version

    def check_header_block_size
      header_block_size == 0x1000
    end # def check_header_block_size

    # Check if the log has been opened and was changed, though not
    # all changes might be reflected in the file header.
    #
    # @return [Boolean]
    def dirty?
      flags & 0x1 == 0x1
    end # def dirty?

    # Check if the log has reached its maximum configured size and the
    # retention policy in effect does not allow a suitable amount of space
    # to be reclaimed from the oldest records; so event messages can not
    # be written to the log file.
    #
    # @return [Boolean]
    def full?
      flags & 0x2 == 0x2
    end # def full?

    def number_of_chunks
      number_of_chunks
    end # def number_of_chunks

    # @return [Boolean]
    def verify
      check_signature &&
        check_major_version &&
        check_minor_version &&
        check_header_block_size
    end # def verify

    public(:number_of_chunks, :verify)
  end # class FileHeader
end # module Evtx
