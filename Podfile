# Uncomment this line to define a global platform for your project
	platform :ios, '9.0'
	use_frameworks!

	#Shared Cocopods
	def shared_pods
	pod 'GiphyCoreSDK', '~> 1.0'
	pod 'Gifu', '~> 3.0'
  	pod 'SwiftyJSON', '~> 4.0'		
	end

	target 'Eaze-iOS-Homework' do
	shared_pods
	end

	target 'Eaze-iOS-HomeworkTests' do
    	inherit! :search_paths
    	shared_pods
  	end

  	target 'Eaze-iOS-HomeworkUITests' do
    	inherit! :search_paths
   	shared_pods
  	end
