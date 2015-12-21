Pod::Spec.new do |s|

  s.name         = "TCRoundedCorner"
  s.version      = "1.0.0"
  s.summary      = "This is a category of UIView which provided the ability of add specified corner(s) to a view with a optional border."

  s.description  = <<-DESC
    This is a category of UIView which provided the ability of add specified corner(s) to a view with a optional border. You can:
        1. Only round myView's corners.
            2. Round corners and add a border together.
                3. Add border only.
                    4. Remove border.
                   DESC

  s.homepage     = "https://github.com/TravelC/TCRoundedCorner"
  s.screenshots  = "https://github.com/TravelC/TCRoundedCorner/blob/master/demoOfTCRoundedCorner.gif"

  s.license      = "MIT"

  s.author             = { "Travel.Chu" => "chuchuanming@gmail.com" }
  s.social_media_url   = "https://twitter.com/chuchuanming"

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/TravelC/TCRoundedCorner.git", :tag => "1.0.0" }

  s.source_files  = "TCRoundedCornerExample/TCRoundedCorner/**/*.{h,m}"
  s.public_header_files = "TCRoundedCornerExample/TCRoundedCorner/**/*.h"

   s.frameworks = "Foundation", "UIKit"


   s.requires_arc = true

end
