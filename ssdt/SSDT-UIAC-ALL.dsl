// SSDT-UIAC-ALL.dsl
//
// This SSDT can be used as a template to build your own
// customization for USBInjectAll.kext.
//
// This SSDT contains all ports, so using it is the same as without
// a custom SSDT.  Delete ports that are not connected or ports you
// do not need.
//
// Change the UsbConnector or portType as needed to match your
// actual USB configuration.
//
// Note:
// portType=0 seems to indicate normal external USB2 port (as seen in MacBookPro8,1)
// portType=2 seems to indicate "internal device" (as seen in MacBookPro8,1)
// portType=4 is used by MacBookPro8,3 (reason/purpose unknown)
//

DefinitionBlock ("", "SSDT", 2, "hack", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "8086_a2af", Package()
            {
                "port-count", Buffer() { 26, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // usb2 front left
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // usb2 front right
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    //"HS03", Package() // usb2 right bottom back
                    //{
                    //    "UsbConnector", 0,
                    //    "port", Buffer() { 3, 0, 0, 0 },
                    //},
                    //"HS04", Package() // usb2 right top back
                    //{
                    //    "UsbConnector", 0,
                    //    "port", Buffer() { 4, 0, 0, 0 },
                    //},
                    "HS05", Package() // usb2 2nd top left back
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                    "HS06", Package() // usb2 top left back
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 6, 0, 0, 0 },
                    },
                    "HS07", Package() //usb 2 bottom left back
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package() // usb2 3rd top left back
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "HS10", Package() // ADDED 255=internal for BT
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "SS01", Package() // usb3 front left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 17, 0, 0, 0 },
                    },
                    "SS02", Package() // usb3 front right
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 18, 0, 0, 0 },
                    },
                    //"SS03", Package() // usb3 bottom right back
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 19, 0, 0, 0 },
                    //},
                    //"SS04", Package() // usb3 top right back
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 20, 0, 0, 0 },
                    //},
                    "SS05", Package() // usb3 2nd top left back
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 21, 0, 0, 0 },
                    },
                    "SS06", Package() // usb3 top left back
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 22, 0, 0, 0 },
                    },
                    "SS07", Package() // bottom left back
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 23, 0, 0, 0 },
                    },
                    "SS08", Package() // 3rd top left back
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 24, 0, 0, 0 },
                    },
                    "SS09", Package() // usb-c port top way up, conector=10
                    {
                        "UsbConnector", 10,
                        "port", Buffer() { 25, 0, 0, 0 },
                    },
                    "SS10", Package() // usb-c port bottom way up, conector=10
                    {
                        "UsbConnector", 10,
                        "port", Buffer() { 26, 0, 0, 0 },
                    },
                },
            },
        })
    }
}
//EOF
