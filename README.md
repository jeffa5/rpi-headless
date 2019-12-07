# Setting up some Raspberry pis

## Installing Raspbian

Download the zip file you want to use, unzip it and then pass the location to the `install.sh` file.

```sh
./install.sh <image.img> <sd_location>
```

The `sd_location` can be found by running `lsblk` after inserting the microSD card.

## Setting up for WIFI

At the moment, the setup script has enabled ssh, but the pi won't know how to connect to your wifi.

Plug it into the network using an ethernet cable and then ssh to its IP address.

```sh
ssh pi@<ip>
```

The password is `raspberry` by default.

Once on, we can run `sudo raspi-config` and then do the following in the TUI.

1.  Change the hostname to something more useful, we'll be able to ssh to this name later
2.  Setup the WiFi using the SSID and password
3.  Reboot, and disconnect the ethernet cable

Now our pi has a name and can connect to the wifi.

To ssh onto the pi we can now do:

```sh
ssh pi@<hostname>
```

## Extra

This
[page](https://www.raspberrypi.org/documentation/configuration/wireless/headless.md)
may be of interest for headless WiFi setup.
