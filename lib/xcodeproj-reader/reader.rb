module XcodeprojReader
  class Reader
    def initialize(project)
      @project = project
    end
    
    def groups
      return ["Classes", "Other Sources", "Resources", "Frameworks", "Products"]
    end
    
    def files(group)
      parser = PbxprojParser.new
      ret = parser.parse(File.read("#{@project}/project.pbxproj"))
      return ["RootViewController.h", "RootViewController.m", "Default_iPhoneAppDelegate.h", "Default_iPhoneAppDelegate.m"]
    end
  end
end