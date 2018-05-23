/etc/sysctl.conf:
  file.append:
    - text: net.ipv4.ip_forward=1

network:
  service.running:
    - enable: True
    - watch:
      - /etc/sysctl.conf
