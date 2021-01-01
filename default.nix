with import <nixpkgs> {};
lib.fix (self: let
  callPackage = lib.callPackageWith self;
in pkgs // {
  workadventure-back = callPackage ./back {};
  workadventure-pusher = callPackage ./pusher {};
  workadventure-messages = callPackage ./messages {};
  workadventure-front = callPackage ./front {};
  workadventure-uploader = callPackage ./uploader {};
  workadventure-maps = callPackage ./maps {};

  workadventure-services = pkgs.symlinkJoin {
    name = "workadventure-services";
    paths = [ 
      self.workadventure-back
      self.workadventure-pusher
      self.workadventure-uploader
    ];
  };
})
