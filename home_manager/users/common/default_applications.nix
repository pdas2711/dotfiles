{ config, pkgs, ... }: {
	# Set default applications
	xdg = {
		configFile."mimeapps.list".force = true;
		mimeApps = {
			enable = true;
			defaultApplications = {
				"text/html" = "brave.desktop";
				"x-scheme-handler/http" = "brave.desktop";
				"x-scheme-handler/https" = "brave.desktop";
				"image/png" = "imv.desktop";
				"image/jpeg" = "imv.desktop";
				"image/gif" = "imv.desktop";
				"image/webp" = "imv.desktop";
				"audio/flac" = "mpv.desktop";
				"video/mkv" = "mpv.desktop";
				"video/mp4" = "mpv.desktop";
				"application/pdf" = "zathura.desktop";
				"application/x-xopp" = "xournalpp.desktop";
			};
		};
		desktopEntries = {
			imv = {
				name = "IMV";
				genericName = "Image Viewer";
				exec = "imv %f";
				terminal = false;
				mimeType = [
					"image/png"
					"image/jpeg"
					"image/gif"
					"image/webp"
				];
			};
			mpv = {
				name = "MPV";
				genericName = "Media Player";
				exec = "mpv %f";
				terminal = false;
				mimeType = [
					"audio/flac"
					"video/mkv"
					"video/mp4"
				];
			};
			zathura = {
				name = "Zathura";
				genericName = "PDF Document Viewer";
				exec = "zathura %f";
				terminal = false;
				mimeType = [ "application/pdf" ];
			};
			brave = {
				name = "Brave";
				genericName = "Web Browser";
				exec = "brave %U";
				terminal = false;
				mimeType = [ "text/html" ];
			};
			xournalpp = {
				name = "Xournal++";
				genericName = "Note Taking Application";
				exec = "xournalpp %f";
				terminal = false;
				mimeType = [ "application/x-xopp" ];
			};
		};
	};
}
