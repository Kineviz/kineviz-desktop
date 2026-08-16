/**
 * Download-page analytics for kineviz.github.io/kineviz-desktop.
 *
 * Why this exists: the real download happens here, not on kineviz.com, so
 * every install was invisible. The GitHub API said 436 downloads existed while
 * the site could see six — and those six were only clicks on the link that
 * sends people here, not installs.
 *
 * Sends to the same collector as kineviz.com. That host allowlists this origin
 * (ALLOWED_ORIGINS in collector/core.ts); without it the browser blocks the
 * request at the CORS preflight before anything is sent.
 *
 * Deliberately small and dependency-free: this page has no build step, and
 * analytics must never break a download.
 */
(function () {
  var COLLECT = "https://kineviz.com/api/collect";

  function send(name, extra) {
    var body = {
      n: name,
      p: location.pathname,
      t: document.title.slice(0, 256),
      r: document.referrer,
      qs: location.search,
      w: (window.screen && window.screen.width) || 0
    };
    if (extra) {
      for (var k in extra) {
        if (Object.prototype.hasOwnProperty.call(extra, k)) body[k] = extra[k];
      }
    }
    var json = JSON.stringify(body);
    try {
      // sendBeacon survives the page being replaced by a download navigation,
      // which is exactly what happens here. Trust only an explicit `true`: a
      // wrapped sendBeacon that returns undefined drops the request silently,
      // which is how the main site lost every event once already.
      if (navigator.sendBeacon) {
        var blob = new Blob([json], { type: "application/json" });
        if (navigator.sendBeacon(COLLECT, blob) === true) return;
      }
      fetch(COLLECT, {
        method: "POST",
        body: json,
        headers: { "Content-Type": "application/json" },
        keepalive: true,
        mode: "cors",
        credentials: "include"
      }).catch(function () {});
    } catch (err) { /* never break the page */ }
  }

  /** Which OS a build is for, read from the filename rather than guessed. */
  function platformOf(url) {
    var u = (url || "").toLowerCase();
    if (u.indexOf("-mac") > -1 || u.indexOf(".dmg") > -1) return "mac";
    if (u.indexOf("-win") > -1 || u.indexOf(".exe") > -1) return "windows";
    if (u.indexOf("-linux") > -1 || u.indexOf(".deb") > -1 || u.indexOf(".appimage") > -1) return "linux";
    return "unknown";
  }

  function fileOf(url) {
    try { return decodeURIComponent(String(url).split("/").pop() || ""); }
    catch (e) { return String(url).split("/").pop() || ""; }
  }

  send("page_view");

  // One listener in the capture phase on the document, so it also catches the
  // build list, which is written into the page after the release data loads.
  document.addEventListener("click", function (ev) {
    var a = ev.target && ev.target.closest && ev.target.closest("a[href]");
    if (!a) return;
    var href = a.getAttribute("href") || "";
    if (!href || href === "#") return;

    var isRelease = href.indexOf("/releases/download/") > -1;
    if (isRelease) {
      send("file_download", {
        props: {
          file: fileOf(href),
          platform: platformOf(href),
          // Which control: the big detected-platform button, or a row in the
          // full build list. Tells us whether platform detection is working.
          via: a.id === "primary-btn" ? "primary button" : "all builds list",
          label: (a.textContent || "").trim().slice(0, 80)
        }
      });
      return;
    }

    if (/^https?:/i.test(href) && href.indexOf(location.host) === -1) {
      send("outbound_click", { props: { url: href.slice(0, 300) } });
    }
  }, true);
})();
