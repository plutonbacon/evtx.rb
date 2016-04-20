# Third-party dependencies.
require 'bindata'

module Evtx
  #
  class ChunkHeader < BinData::Record
    # "ElfChunk\x00"
    string    :signature, length: 8

    uint64le  :first_event_record_number
    uint64le  :last_event_record_number
    uint64le  :first_event_record_identifier
    uint64le  :last_event_record_identifier
    uint32le  :header_size
    uint32le  :last_event_record_data_offset
    uint32le  :free_space_offset
    uint32le  :event_records_checksum
    string    :unused, length: 44
    uint32le  :checksum

    private

    # Check that first eight bytes of the ChunkHeader match the
    # expected signature.
    #
    # @return [Boolean]
    def check_signature
      signature == "ElfChnk\x00"
    end # def check_signature

    public(:check_signature)
  end # class ChunkHeader
end # module Evtx
