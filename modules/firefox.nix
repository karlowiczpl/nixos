{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";

    profiles.karol = {
      isDefault = true;
      id = 0;
      name = "karol";

      settings = {
        "browser.ctrlTab.previews" = true;
        "browser.ctrlTab.recentlyUsedOrder" = true;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
      };
    };
  };
}
