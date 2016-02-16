require 'evtx/fileheader'

module Evtx
  # 
  class File 
    # 
    #
    # @return [String]
    attr_accessor :path

    #
    attr_accessor :buffer

    #
    attr_accessor :fileheader

    #
    def initialize(path)
      @path = path
      @buffer = IO.read(@path)
      @fileheader = FileHeader.read(@buffer)
    end # def initialize

  end # class File
end # module Evtx
