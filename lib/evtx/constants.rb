module Evtx
  module Constants
    # The EVTX file header is 4096 bytes in size, though only 128 bytes
    # are actually in use. This allows the entire file header to cleanly
    # reside in a single "page" in memory.
    HEADER_SIZE = 4096

    # Each chunk is 64 kiB in size.
    CHUNK_SIZE = 65_536
  end # module Constants
end # module Evtx
