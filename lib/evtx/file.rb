require 'evtx/chunkheader'
require 'evtx/fileheader'

module Evtx
  # The Windows XML Event Log (EVTX) format was introducted in Windows Vista
  # as a replacement for the Windows Event Log (EVT) format.
  #
  # The format consists of a small file header which is followed by a series
  # of chunks. Chunks are self-contained; with no event record ever extending
  # over the boundary between two chunks.
  #
  # The event log files can normally be found in:
  #   C:\Windows\System32\winevt\Logs\
  class File 
    #
    #
    # @return [Evtx::FileHeader]
    attr_accessor :fileheader

    #
    #
    # @return [Array]
    attr_accessor :chunks

    def initialize(path)
      offset = 0
      chunks = []

      open path, 'r' do |f|
        buffer = f.read 4096
        @fileheader = FileHeader.read(buffer)

        # TODO - Validate the header

        offset += 4096
        f.seek offset
        for i in 1..@fileheader.number_of_chunks
          buffer = f.read 65536
          puts ChunkHeader.read(buffer).signature
          offset += 65536
          f.seek offset
        end
      end
    end # def initialize
  end # class File
end # module Evtx
