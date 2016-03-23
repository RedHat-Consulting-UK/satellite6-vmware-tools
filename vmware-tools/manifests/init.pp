# vmware-tools puppet module

class vmware-tools {
	if  $operatingsystem == "RedHat" {
		case $operatingsystemrelease {
 		   /^7.*/: {
			package { 'open-vm-tools': 
				ensure => 'latest',
			}                        
                   }
		   /^6.*/: {
        		package { 'vmware-tools-esx-kmods':
				ensure => latest, 
			
			}->
			package { 'vmware-tools-esx-nox':
				ensure => latest,
			}
    		   }
   		   /^5.*/: {
    		   	package { 'vmware-tools-esx-kmods':
                                ensure => latest,

                        }->
                        package { 'vmware-tools-esx-nox':
                                ensure => latest,
                        }
		   }
		}
	}
}
