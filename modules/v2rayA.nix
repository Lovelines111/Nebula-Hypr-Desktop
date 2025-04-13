{pkgs, ... }:
{
  # Allow user to run v2rayA without a password
security.sudo = {
  enable = true;
  # Allow the user to run v2rayA without a password
  extraConfig = ''
    luvelyne ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/v2rayA
  '';
};


  systemd.services.v2raya = {
    description = "v2rayA system service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    requires = [ "network-online.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.sudo}/bin/sudo ${pkgs.v2raya}/bin/v2rayA";
      User = "root";
      Group = "root";
      Restart = "on-failure";
      Environment = "PATH=${pkgs.v2ray}/bin:${pkgs.v2raya}/bin:/run/current-system/sw/bin";
      };
  };
}
