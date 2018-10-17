neutron:
  server:
    enabled: true
    fwaas: false
    path_mtu: 1500
    dns_domain: novalocal
    tunnel_type: vxlan
    version: liberty
    api_workers: 2
    rpc_workers: 2
    dhcp_lease_duration: 86400
    agent_boot_time: 900
    backend:
      engine: contrail
      #contrail_discovery_host
      host: 127.0.0.1
      port: 8082
      user: admin
      password: password
      token: token
      tenant: admin
    bind:
      address: 127.0.0.1
      port: 9696
    database:
      engine: mysql
      host: 127.0.0.1
      port: 3306
      name: neutron
      user: neutron
      password: password
    identity:
      engine: keystone
      region: RegionOne
      host: 127.0.0.1
      port: 35357
      user: neutron
      password: password
      tenant: service
      endpoint_type: internal
    message_queue:
      engine: rabbitmq
      members:
      - host: 127.0.0.1
      - host: 127.0.1.1
      - host: 127.0.2.1
      user: openstack
      password: password
      virtual_host: '/openstack'
    compute:
      host: 127.0.0.1
      region: RegionOne
      user: nova
      password: password
      tenant: service
    audit:
      filter_factory: 'keystonemiddleware.audit:filter_factory'
      map_file: '/etc/pycadf/neutron_api_audit_map.conf'
    policy:
      create_subnet: 'rule:admin_or_network_owner'
      'get_network:queue_id': 'rule:admin_only'
      'create_network:shared':

