{
  services.printing.enable = true;

  hardware.printers = {
    ensurePrinters = [
      {
        deviceUri = "ipps://wpvapppcprt02:9164/printers/itap-printing";
        location = "school";
        name = "itap-printing";
        model = "everywhere";
      }
    ];
  };
}
