module XcodeprojReader
  class Reader
    def initialize(project)
      
    end
    
    def groups
      return ["Classes", "Other Sources", "Resources", "Frameworks", "Products"]
    end
    
  end
end