module XcodeprojReader
  class Reader
    def initialize(project)
      
    end
    
    def groups
      return ["Classes", "Other Sources", "Resources", "Frameworks", "Products"]
    end
    
    def files(group)
      return ["RootViewController.h", "RootViewController.m", "Default_iPhoneAppDelegate.h", "Default_iPhoneAppDelegate.m"]
    end
  end
end