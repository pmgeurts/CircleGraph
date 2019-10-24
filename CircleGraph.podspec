
Pod::Spec.new do |s|

  s.name         = "CircleGraph"
  s.version      = "0.1.0"
  s.summary      = "A compact class to generate customizable circle graphs."

  s.description  = <<-DESC
                   A compact class to generate circle graphs with customizable aspects like size, line width, colors, and animation.
                   DESC

  s.homepage     = "https://github.com/pmgeurts/CircleGraph"
  s.license      = "MIT"
  s.author       = { "Paul Geurts" => "pmgeurts@gmail.com" }
  s.source       = { :git => "https://github.com/pmgeurts/CircleGraph.git", :tag => "v0.0.1" }
  s.swift_version    = '5.0'
  s.platforms = { :ios => "12.2" }

#s.source_files  = "Sources/**/*.swift"
  s.source_files  = "CircleGraph/*.swift"

end
