# vmware-tools puppet module

class vmware-tools {
      if $is_virtual {	
	# currently only handles RHEL but could handle other distro as well
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
   else 
   {
	# remove open-vm-tools from physical machines
        package { 'open-vm-tools':
            ensure => 'purged',
        }

	# remove vmware tools from physical machines
	package { 'vmware-tools-esx-kmods'
	    ensure => 'purged',
	}-> 
	package { 'vmware-tools-esx-nox':
            ensure => purged,
        }
   }
}
