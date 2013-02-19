# This is a place to define your nodes

node base {
	include sudo, ssh
	user { "cutter":
	ensure => present,
	home     => '/home/cutter',
	password => 'Zfvu9HNYaaeHU',
	shell    => '/bin/bash',

}
}

node 'puppet.localdomain' inherits base {
}
node 'rnb-pec-01.localdomain' inherits base {
	user { "pec.user":
		comment => "pec user",
		home => "/home/pec.user",
		ensure => present,
		password => '$1$RiBlfzOy$SugdkWGMJwXX8WFqCFW0./',
		#shell => "/bin/bash",
		#uid => '501',
		#gid => '20'
	}
}
node 'centosvm01.localdomain' inherits base {
	tomcat7_rhel::tomcat_application { "my-web-application":
	application_root => "/opt",
	tomcat_user => "webuser",
	tomcat_port => "8080",
	jvm_envs => "-server -Xmx1024m -Xms128m -XX:MaxPermSize=256m -Dmy.java.opt=i_love_java -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=some.ip.address",
	tomcat_manager => true,
	tomcat_admin_user => "superuser",
	tomcat_admin_password => "secretpassword",
	jmx_registry_port => 10054,
	jmx_server_port => 10053
} 
tomcat7_rhel::tomcat_application { "my-second-application":
application_root => "/opt",
tomcat_user => "webuser",
tomcat_port => "8090",
jvm_envs => "-server -Xmx1024m -Xms128m -XX:MaxPermSize=256m -Dmy.java.opt=i_love_scala -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=some.ip.address"
}
}
node 'solaris-pec-01.localdomain' {
}
node 'lion-pec-01.localdomain' {
	user { "ricky":
	ensure => present,
	password         => '$1$RiBlfzOy$SugdkWGMJwXX8WFqCFW0./',
}
}
