
! function(t) {
	t.fn.svgCircle = function(e) {
		return e = t.extend({
			parent: null,
			w: 75,
			R: 30,
			sW: 20,
			color: ["#000", "#000"],
			perent: [100, 100],
			speed: 0,
			delay: 1e3
		}, e), this.each(function() {
			var t = e.parent;
			if (!t) return !1; {
				var r = e.w,
					a = Raphael(t, r, r),
					n = e.R,
					s = {
						stroke: "#78b461"
					};
				document.location.hash
			}
			a.customAttributes.arc = function(t, a, n) {
				{
					var s, o = 360 / a * t,
						c = (90 - o) * Math.PI / 180,
						i = r / 2 + n * Math.cos(c),
						h = r / 2 - n * Math.sin(c);
					e.color
				}
				return s = a == t ? [
					["M", r / 2, r / 2 - n],
					["A", n, n, 0, 1, 1, r / 2 - .01, r / 2 - n]
				] : [
					["M", r / 2, r / 2 - n],
					["A", n, n, 0, +(o > 180), 1, i, h]
				], {
					path: s
				}
			};
			var o = (a.path().attr({
				stroke: "#f0f0f0",
				"stroke-width": e.sW
			}).attr({
				arc: [100, 100, n]
			}), a.path().attr({
				stroke: "#f36767",
				"stroke-width": e.sW
			}).attr(s).attr({
				arc: [.01, e.speed, n]
			}));
			e.perent[1] > 0 ? setTimeout(function() {
				o.animate({
					stroke: e.color[1],
					arc: [e.perent[1], 100, n]
				}, 900, ">")
			}, e.delay) : o.hide()
		})
	}
}(jQuery),
function() {
	var t = $(".round-progress");
	t.each(function() {
		$(this).data("bPlay", !0);
		var t = $(this).parent().find("span").text().replace(/\%/, "");
		$(this).svgCircle({
			parent: $(this)[0],
			w: 66,
			R: 26,
			sW: 5,
			color: ["#ff5b07", "#ff5b07", "#ff5b07"],
			perent: [100, t],
			speed: 150,
			delay: 400
		})
	})
}();