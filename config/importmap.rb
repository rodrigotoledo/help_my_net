# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "hotwire", to: "https://ga.jspm.io/npm:hotwire@0.0.1/index.js"
pin "ajv", to: "https://ga.jspm.io/npm:ajv@6.12.6/lib/ajv.js"
pin "ajv/lib/refs/json-schema-draft-06.json", to: "https://ga.jspm.io/npm:ajv@6.12.6/lib/refs/json-schema-draft-06.json.js"
pin "asn1", to: "https://ga.jspm.io/npm:asn1@0.2.6/lib/index.js"
pin "assert", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/assert.js"
pin "assert-plus", to: "https://ga.jspm.io/npm:assert-plus@1.0.0/assert.js"
pin "aws-sign2", to: "https://ga.jspm.io/npm:aws-sign2@0.7.0/index.js"
pin "aws4", to: "https://ga.jspm.io/npm:aws4@1.10.1/aws4.js"
pin "bcrypt-pbkdf", to: "https://ga.jspm.io/npm:bcrypt-pbkdf@1.0.2/index.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/buffer.js"
pin "caseless", to: "https://ga.jspm.io/npm:caseless@0.12.0/index.js"
pin "combined-stream", to: "https://ga.jspm.io/npm:combined-stream@1.0.8/lib/combined_stream.js"
pin "core-util-is", to: "https://ga.jspm.io/npm:core-util-is@1.0.2/lib/util.js"
pin "crypto", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/crypto.js"
pin "delayed-stream", to: "https://ga.jspm.io/npm:delayed-stream@1.0.0/lib/delayed_stream.js"
pin "ecc-jsbn", to: "https://ga.jspm.io/npm:ecc-jsbn@0.1.2/index.js"
pin "ecc-jsbn/lib/ec", to: "https://ga.jspm.io/npm:ecc-jsbn@0.1.2/lib/ec.js"
pin "events", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/events.js"
pin "extend", to: "https://ga.jspm.io/npm:extend@3.0.2/index.js"
pin "extsprintf", to: "https://ga.jspm.io/npm:extsprintf@1.3.0/lib/extsprintf.js"
pin "fast-deep-equal", to: "https://ga.jspm.io/npm:fast-deep-equal@3.1.3/index.js"
pin "fast-json-stable-stringify", to: "https://ga.jspm.io/npm:fast-json-stable-stringify@2.1.0/index.js"
pin "forever-agent", to: "https://ga.jspm.io/npm:forever-agent@0.6.1/index.js"
pin "form-data", to: "https://ga.jspm.io/npm:form-data@2.3.3/lib/browser.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/fs.js"
pin "har-schema", to: "https://ga.jspm.io/npm:har-schema@2.0.0/lib/index.js"
pin "har-validator", to: "https://ga.jspm.io/npm:har-validator@5.1.5/lib/promise.js"
pin "http", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/http.js"
pin "http-signature", to: "https://ga.jspm.io/npm:http-signature@1.2.0/lib/index.js"
pin "https", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/https.js"
pin "is-typedarray", to: "https://ga.jspm.io/npm:is-typedarray@1.0.0/index.js"
pin "isstream", to: "https://ga.jspm.io/npm:isstream@0.1.2/isstream.js"
pin "jsbn", to: "https://ga.jspm.io/npm:jsbn@0.1.1/index.js"
pin "json-schema", to: "https://ga.jspm.io/npm:json-schema@0.4.0/lib/validate.js"
pin "json-schema-traverse", to: "https://ga.jspm.io/npm:json-schema-traverse@0.4.1/index.js"
pin "json-stringify-safe", to: "https://ga.jspm.io/npm:json-stringify-safe@5.0.1/stringify.js"
pin "jsprim", to: "https://ga.jspm.io/npm:jsprim@1.4.2/lib/jsprim.js"
pin "mime-db", to: "https://ga.jspm.io/npm:mime-db@1.51.0/index.js"
pin "mime-types", to: "https://ga.jspm.io/npm:mime-types@2.1.34/index.js"
pin "net", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/net.js"
pin "oauth-sign", to: "https://ga.jspm.io/npm:oauth-sign@0.9.0/index.js"
pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/path.js"
pin "performance-now", to: "https://ga.jspm.io/npm:performance-now@2.1.0/lib/performance-now.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/process-production.js"
pin "psl", to: "https://ga.jspm.io/npm:psl@1.8.0/index.js"
pin "punycode", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/punycode.js"
pin "qs", to: "https://ga.jspm.io/npm:qs@6.5.3/lib/index.js"
pin "querystring", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/querystring.js"
pin "request", to: "https://ga.jspm.io/npm:request@2.88.2/index.js"
pin "safe-buffer", to: "https://ga.jspm.io/npm:safe-buffer@5.2.1/index.js"
pin "safer-buffer", to: "https://ga.jspm.io/npm:safer-buffer@2.1.2/safer.js"
pin "sshpk", to: "https://ga.jspm.io/npm:sshpk@1.17.0/lib/index.js"
pin "stream", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/stream.js"
pin "tls", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/tls.js"
pin "tough-cookie", to: "https://ga.jspm.io/npm:tough-cookie@2.5.0/lib/cookie.js"
pin "tunnel-agent", to: "https://ga.jspm.io/npm:tunnel-agent@0.6.0/index.js"
pin "tweetnacl", to: "https://ga.jspm.io/npm:tweetnacl@0.14.5/nacl-fast.js"
pin "underscore", to: "https://ga.jspm.io/npm:underscore@1.13.2/underscore-umd-min.js"
pin "uri-js", to: "https://ga.jspm.io/npm:uri-js@4.4.1/dist/es5/uri.all.js"
pin "url", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/url.js"
pin "util", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/util.js"
pin "uuid/lib/rng.js", to: "https://ga.jspm.io/npm:uuid@3.4.0/lib/rng-browser.js"
pin "uuid/v4", to: "https://ga.jspm.io/npm:uuid@3.4.0/v4.js"
pin "verror", to: "https://ga.jspm.io/npm:verror@1.10.0/lib/verror.js"
pin "zlib", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.14/nodelibs/browser/zlib.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.1/app/assets/javascripts/actioncable.esm.js"
pin "cable_ready", to: "https://ga.jspm.io/npm:cable_ready@5.0.0-pre8/javascript/index.js"
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.6.1/dist/morphdom.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.0.1/dist/stimulus.js"
pin "slim-select", to: "https://ga.jspm.io/npm:slim-select@1.27.1/dist/slimselect.min.mjs"
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@2.6.1/dist/mapbox-gl.js"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
