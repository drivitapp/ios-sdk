Pod::Spec.new do |s|
	s.name		= 'Drivit'
	s.version	= '4.9.1'

	s.summary	= 'A really cool SDK.'
	s.homepage	= 'https://www.drivit.com'
	s.license	= { :type => 'LICENSE', :file => 'LICENSE' }
	s.author	= { 'Adão Rodrigues' => 'adao.rodrigues@zego.com' }

	s.platform	= :ios
	s.requires_arc = true
	s.static_framework = true
	s.ios.deployment_target = '10.0'

	s.vendored_frameworks = 'Drivit.framework'
	s.resource_bundles = { 'Resources' => ['Drivit.bundle'] }

	s.source = { :git => 'https://github.com/drivitapp/ios-sdk.git', :tag => s.version }
	s.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(inherited) "${PODS_ROOT}/Drivit/Drivit.framework" "${PODS_CONFIGURATION_BUILD_DIR}/Drivit"' }

	s.dependency 'Firebase/Messaging', '7.9.0'
	s.dependency 'Firebase/Analytics', '7.9.0'
end
