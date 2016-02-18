# Third-party dependencies.
require 'bindata'

module Evtx
  #
  class Record < BinData::Record

    # "ElfChunk\x00"
    uint32le  :signature

    # The size of the event record including the signature
    # and the size.
    uint32le  :size

    uint64le  :event_record_identifier

    # The date and time the event record was written (logged)
    uint64le  :timestamp

    private

    # Check that first eight bytes of the ChunkHeader match the
    # expected signature.
    #
    # @return [Boolean]
    def check_signature
      signature == "\x2a\x2a\x00\x00"
    end # def check_signature

    public(:check_signature)
  end # class Record
end # module Evtx
