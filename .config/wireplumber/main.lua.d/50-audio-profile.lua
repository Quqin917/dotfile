rule = {
  matches = {
    {
      { "device.name", "equals", "alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic" },
    },
  },
  apply_properties = {
    ["device.profile"] = "HiFi",
  }
}

table.insert(alsa_monitor.rules, rule)
