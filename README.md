# satellite6-vmware-tools
Puppet Module to be used with Satellite 6 to automatically install the VMWare tools / Open VMWare tools module. 

1) First create a custom product inside satellite 6, or add a new repoistory for the VMware tools repository to an existing custom product. 

The following repoistories should be added as type yum (depending on if you have RHEL6/5 VMware guests): 

RHEL6 VMware tools repository: https://packages.vmware.com/tools/esx/latest/rhel6/x86_64/index.html
RHEL5 VMware tools repository: https://packages.vmware.com/tools/esx/latest/rhel5/x86_64/index.html

Ensure that your corporate proxy and firewall allows the Satellite 6 server to communicate with vmware.com.

It is also possible to use reposync & createrepo (https://access.redhat.com/solutions/23016) to create an offline repository which Satellite 6 can sync from. 

2) Next, the puppet module must be built and added to the satellite 6 server. To do that, download or clone the module code and run the following command inside the module folder: 

puppet module build . 

Note that puppet must be installed on the server where the module is being compiled, this can be done on the satellite server itself. 

After the module has been built, there should be a new folder (called pkg) which contains a file similar to vmware-tools-0.0.1.tar.gz (note the version may differ). 

3) Next, add the puppet module to a custom product/repository inside Satellite 6. 

Once that has been complete, make sure the product and module has been added to a content view and the content view has been published/promoted. 

If content view has been published/promoted correctly and the module has been added correctly, you should now be able to add the vmware-tools puppet module to hosts/hostgroups or to hiera config files. 

