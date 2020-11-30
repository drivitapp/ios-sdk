Pod::Spec.new do |s|
	s.name		= 'Drivit'
	s.version	= '4.4.0'

	s.summary	= 'A really cool SDK.'
	s.homepage	= 'https://www.drivit.com'
	s.license	= { :type => 'LICENSE', :file => 'LICENSE' }
	s.author	= { 'Adão Rodrigues' => 'adao.rodrigues@drivit.com' }

	s.platform	= :ios
	s.requires_arc = true
	s.swift_version = "5.0"
	s.static_framework = true
	s.ios.deployment_target = '10.0'

	s.vendored_frameworks = 'framework/Drivit.framework'
	s.resource_bundles = { 'Resources' => ['framework/Drivit.bundle'] }

	s.source = { :path => 'framework/Drivit.framework' }
	s.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(inherited) "${PODS_ROOT}/../../iOS-core/framework/Drivit.framework"' }

	s.dependency 'Firebase/Messaging', '7.1.0'
end
