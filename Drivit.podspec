Pod::Spec.new do |s|
	s.name		= 'Drivit'
	s.version	= '4.0.0'
	s.summary	= 'A really cool SDK.'
	s.homepage	= 'https://www.drivit.com'

	s.license	= { :type => 'LICENSE', :file => 'LICENSE' }
	s.author	= { 'Adão Rodrigues' => 'adao.rodrigues@drivit.com' }

	s.source	= { :git => 'https://github.com/drivitapp/iOS-SDK.git', :tag => s.version }
	#s.source	= { :git => 'https://github.com/drivitapp/ios-sdk-sample', :tag => s.version }
	#s.source 	= { :path => 'Drivit.framework' }

	s.platform	= :ios

	s.ios.deployment_target		= '10.0'
	s.ios.vendored_frameworks	= 'Drivit.framework'

	s.dependency 'Firebase/Core'

	s.swift_version = "5.0"
end
