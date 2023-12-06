'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.jpeg": "50da2138b5a49e991d92f8e679b85143",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "15835177a38c8e51044aa47b628b8213",
"index.html": "0aa675b7f008265f3ece8a84387fbb67",
"/": "0aa675b7f008265f3ece8a84387fbb67",
"icons/92.png": "f0692dac8104ceb726b619d712f20620",
"icons/50.png": "a500a2ee76a5c1ea5c4b1b83feeb1877",
"icons/20.png": "a35528ef0b5864b8c9aac9ad887cd36a",
"icons/256.png": "51725a604941eff31f64f8447b896239",
"icons/55.png": "b466a8dadf3180efd9d8c4e230b5e5c4",
"icons/180.png": "ed6ee5d549649d1530fa4d7661118efa",
"icons/58.png": "e040567d4a3e2bbf11b24177099d6180",
"icons/80.png": "91019155a7fc6d72a35b33af6de11012",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/48.png": "076ca36a4157b874ce732b83b57cd2b1",
"icons/64.png": "0e86192dd66f976c3a15940fbc2f69ca",
"icons/29.png": "526035049c274fdb1351f257d064bde2",
"icons/167.png": "7866636b326913560a8ebb8c967c69d5",
"icons/100.png": "8578400dffad8b292de1f500623adde0",
"icons/1024.png": "f975629221640afdafbb72c8df12b3fa",
"icons/172.png": "a44f248308fa9aacd6617bb53aab50fd",
"icons/32.png": "3b4051a1c3b17c9aa8e92bcf66420e05",
"icons/114.png": "c7a20687138a564707b07e8d1dbcc3ff",
"icons/102.png": "f81b8d7f25661f548aec004e84a3822e",
"icons/196.png": "af5474fdd213ab34537d712d2748bd86",
"icons/66.png": "8a8d9323e9f28d12a1aee9cdea00a471",
"icons/152.png": "2d3332a60774dcab63c0db7faf9a29ac",
"icons/88.png": "4b9439e54867d913209a1d14cf149256",
"icons/60.png": "13928ab6422688cc5eec7eaa9ae03827",
"icons/87.png": "0737b951722bff3e67aa8210136646d9",
"icons/216.png": "da74aca7c5c6237d2a897e5275cfbe08",
"icons/144.png": "493878c6bcf4db812ed562db13e89efd",
"icons/120.png": "77361e6771d9d7dc8860076ddfa80496",
"icons/128.png": "bb3ea3d9af35f6bbcb283db0346b2550",
"icons/72.png": "a62dc58b9d95c3f3816ef76052564a77",
"icons/57.png": "4448d877239b82d79b973dd8e6e651e9",
"icons/76.png": "d13f4283c7cdf43bbed8b89a6238d8a2",
"icons/16.png": "b75676d251ed9d2fe0e628ffd37208a8",
"icons/512.png": "64217b0cab2d1d48c34a1ece0f1738a3",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/40.png": "6cf23202bdf93ececad5c1db73fa53c3",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "6e05d724c19cdc92fdbd1f0748d7b448",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f2163b9d4e6f1ea52063f498c8878bb9",
"assets/NOTICES": "f90f9fa27f2083d306e9360f5c22056c",
"assets/AssetManifest.json": "9ae00cf692fb95cf7d7bf21fd032294f",
"assets/AssetManifest.bin.json": "8a6d3cc65476733e9a9e9ecc7c76452e",
"assets/site.webmanifest": "2ab373f2d983bb4c2056cde77cf5ebd2",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/audios/vanessa-paradi-haute-couture.mp3": "5dcab085b1ef7b43781a8b45647c82af",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/FSH-1688387282387-photodp1.jpg": "3e11ad56884485183329ebfdb99e61cd",
"assets/assets/images/FSH-1688387284670-photodp4.jpg": "6740b08785fa01e79cae7249af456d50",
"assets/assets/images/1e15e796c43f7fae4fd8be3cc75aaf7040c3722a80accf0d6852334d92f8d4602f3e9bb83d4800a8e427d1bf08b6f04adef87d9e28832f34ff5a13d6b3e7478f.jpeg": "54d6f16a37aff2ec8f7a577fc0d1e257",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/FSH-1688387283758-photodp3.jpg": "707d1401e21989d408868ff168c8dabf",
"assets/assets/images/FSH-1688387282955-photodp2.jpg": "6bde2f1feab50425180adab44b6129f9",
"assets/assets/images/FSH-1688387285354-photodp5.jpg": "f15574ab803d041489fe7bf46cfe9427",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/AssetManifest.bin": "5a4379abd71da2061ba0bd1daedbd8bd",
"assets/fonts/MaterialIcons-Regular.otf": "e52a2d1e1bb22219eed264450faab684",
"assets/loading.gif": "4b0b6a234793d186f13703f750d9b857",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"main.dart.js": "92a1844d3bb3bd6babecd43c9976a5e4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
