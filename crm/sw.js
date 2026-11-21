// Och · CRM – Service Worker: macht die App installierbar und offline nutzbar.
// Er speichert nur die App-Dateien, niemals deine Daten (die liegen verschlüsselt in IndexedDB).
const CACHE = 'och-crm-v2';
const ASSETS = ['./', './index.html', './manifest.webmanifest', './icon-192.png', './icon-512.png', './apple-touch-icon.png'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)).then(() => self.skipWaiting()));
});
self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== CACHE).map(k => caches.delete(k)))).then(() => self.clients.claim()));
});
self.addEventListener('fetch', e => {
  const r = e.request;
  if (r.method !== 'GET' || new URL(r.url).origin !== location.origin) return;
  if (r.mode === 'navigate') {
    // Netz zuerst, damit Updates sofort ankommen; offline aus dem Cache
    e.respondWith(fetch(r).then(res => {
      if (res.ok) { const c = res.clone(); caches.open(CACHE).then(x => x.put('./index.html', c)); }
      return res;
    }).catch(() => caches.match('./index.html')));
    return;
  }
  e.respondWith(caches.match(r).then(m => m || fetch(r)));
});
