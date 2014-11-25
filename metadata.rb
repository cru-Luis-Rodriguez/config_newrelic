name             'config_newrelic'
maintainer       'cru'
maintainer_email 'luis.rodriguez@cru.org'
license          'All rights reserved'
description      'Installs/Configures config_newrelic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'


depends "newrelic", "~> 2.4.0"
depends "tomcat6", "~> 0.5.4"
