# README for the robot

This robot shows you how to write a simple message to Telegram using Notifier and using a POST Request. Remember that Telegram only support HTTPS request, so you will need a `.pem` certificate.

## Configuration

Configure your `devdata/env.json` to the right direction for the `vault.json` file. The credentials need to be under `Telegram` and have the `Token` items. You can write directly in the code for quick test. Also, you need to have a `.pem` certificate to create a good request. You can find a certificate here: `https://github.com/witnessmenow/Universal-Arduino-Telegram-Bot/blob/master/src/TelegramCertificate.h`, I have use that one in the past an worked nicely. You only need to copy from `-----BEGIN CERTIFICATE-----` to `-----END CERTIFICATE-----`.

## License

MIT License

Copyright (c) [2021] [Alejandro Antunes]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### Additional documentation
See [Robocorp Docs](https://robocorp.com/docs/) for more documentation.
