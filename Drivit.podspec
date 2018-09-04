Pod::Spec.new do |s|
	s.name		= 'Drivit'
	s.version	= '1.3.10'
	s.summary	= 'A really cool SDK.'
	s.homepage	= 'https://www.drivit.com'

	s.license	= { :type => 'LICENSE', :file => 'LICENSE' }
	s.author	= { 'Adão Rodrigues' => 'adao.rodrigues@drivit.com' }

	s.source	= { :git => 'https://github.com/drivitapp/iOS-SDK.git', :tag => s.version }

	s.platform	= :ios

	s.ios.deployment_target		= '10.0'
	s.ios.vendored_frameworks	= 'Drivit.framework'

	# s.framework = "UIKit"
	# s.dependency 'MagicalRecord', '~> 2.3.3'

	# s.swift_version = "4.1"
end
