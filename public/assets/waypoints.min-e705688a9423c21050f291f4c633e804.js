(function(){var t=[].indexOf||function(t){for(var e=0,n=this.length;n>e;e++)if(e in this&&this[e]===t)return e;return-1},e=[].slice;!function(t,e){return"function"==typeof define&&define.amd?define("waypoints",["jquery"],function(n){return e(n,t)}):e(t.jQuery,t)}(this,function(n,r){var i,o,l,s,c,u,a,f,h,d,p,v,y,w,g,m;return i=n(r),f=t.call(r,"ontouchstart")>=0,s={horizontal:{},vertical:{}},c=1,a={},u="waypoints-context-id",p="resize.waypoints",v="scroll.waypoints",y=1,w="waypoints-waypoint-ids",g="waypoint",m="waypoints",o=function(){function t(t){var e=this;this.$element=t,this.element=t[0],this.didResize=!1,this.didScroll=!1,this.id="context"+c++,this.oldScroll={x:t.scrollLeft(),y:t.scrollTop()},this.waypoints={horizontal:{},vertical:{}},this.element[u]=this.id,a[this.id]=this,t.bind(v,function(){var t;return e.didScroll||f?void 0:(e.didScroll=!0,t=function(){return e.doScroll(),e.didScroll=!1},r.setTimeout(t,n[m].settings.scrollThrottle))}),t.bind(p,function(){var t;return e.didResize?void 0:(e.didResize=!0,t=function(){return n[m]("refresh"),e.didResize=!1},r.setTimeout(t,n[m].settings.resizeThrottle))})}return t.prototype.doScroll=function(){var t,e=this;return t={horizontal:{newScroll:this.$element.scrollLeft(),oldScroll:this.oldScroll.x,forward:"right",backward:"left"},vertical:{newScroll:this.$element.scrollTop(),oldScroll:this.oldScroll.y,forward:"down",backward:"up"}},!f||t.vertical.oldScroll&&t.vertical.newScroll||n[m]("refresh"),n.each(t,function(t,r){var i,o,l;return l=[],o=r.newScroll>r.oldScroll,i=o?r.forward:r.backward,n.each(e.waypoints[t],function(t,e){var n,i;return r.oldScroll<(n=e.offset)&&n<=r.newScroll?l.push(e):r.newScroll<(i=e.offset)&&i<=r.oldScroll?l.push(e):void 0}),l.sort(function(t,e){return t.offset-e.offset}),o||l.reverse(),n.each(l,function(t,e){return e.options.continuous||t===l.length-1?e.trigger([i]):void 0})}),this.oldScroll={x:t.horizontal.newScroll,y:t.vertical.newScroll}},t.prototype.refresh=function(){var t,e,r,i=this;return r=n.isWindow(this.element),e=this.$element.offset(),this.doScroll(),t={horizontal:{contextOffset:r?0:e.left,contextScroll:r?0:this.oldScroll.x,contextDimension:this.$element.width(),oldScroll:this.oldScroll.x,forward:"right",backward:"left",offsetProp:"left"},vertical:{contextOffset:r?0:e.top,contextScroll:r?0:this.oldScroll.y,contextDimension:r?n[m]("viewportHeight"):this.$element.height(),oldScroll:this.oldScroll.y,forward:"down",backward:"up",offsetProp:"top"}},n.each(t,function(t,e){return n.each(i.waypoints[t],function(t,r){var i,o,l,s,c;return i=r.options.offset,l=r.offset,o=n.isWindow(r.element)?0:r.$element.offset()[e.offsetProp],n.isFunction(i)?i=i.apply(r.element):"string"==typeof i&&(i=parseFloat(i),r.options.offset.indexOf("%")>-1&&(i=Math.ceil(e.contextDimension*i/100))),r.offset=o-e.contextOffset+e.contextScroll-i,r.options.onlyOnScroll&&null!=l||!r.enabled?void 0:null!==l&&l<(s=e.oldScroll)&&s<=r.offset?r.trigger([e.backward]):null!==l&&l>(c=e.oldScroll)&&c>=r.offset?r.trigger([e.forward]):null===l&&e.oldScroll>=r.offset?r.trigger([e.forward]):void 0})})},t.prototype.checkEmpty=function(){return n.isEmptyObject(this.waypoints.horizontal)&&n.isEmptyObject(this.waypoints.vertical)?(this.$element.unbind([p,v].join(" ")),delete a[this.id]):void 0},t}(),l=function(){function t(t,e,r){var i,o;r=n.extend({},n.fn[g].defaults,r),"bottom-in-view"===r.offset&&(r.offset=function(){var t;return t=n[m]("viewportHeight"),n.isWindow(e.element)||(t=e.$element.height()),t-n(this).outerHeight()}),this.$element=t,this.element=t[0],this.axis=r.horizontal?"horizontal":"vertical",this.callback=r.handler,this.context=e,this.enabled=r.enabled,this.id="waypoints"+y++,this.offset=null,this.options=r,e.waypoints[this.axis][this.id]=this,s[this.axis][this.id]=this,i=null!=(o=this.element[w])?o:[],i.push(this.id),this.element[w]=i}return t.prototype.trigger=function(t){return this.enabled?(null!=this.callback&&this.callback.apply(this.element,t),this.options.triggerOnce?this.destroy():void 0):void 0},t.prototype.disable=function(){return this.enabled=!1},t.prototype.enable=function(){return this.context.refresh(),this.enabled=!0},t.prototype.destroy=function(){return delete s[this.axis][this.id],delete this.context.waypoints[this.axis][this.id],this.context.checkEmpty()},t.getWaypointsByElement=function(t){var e,r;return(r=t[w])?(e=n.extend({},s.horizontal,s.vertical),n.map(r,function(t){return e[t]})):[]},t}(),d={init:function(t,e){var r;return null==e&&(e={}),null==(r=e.handler)&&(e.handler=t),this.each(function(){var t,r,i,s;return t=n(this),i=null!=(s=e.context)?s:n.fn[g].defaults.context,n.isWindow(i)||(i=t.closest(i)),i=n(i),r=a[i[0][u]],r||(r=new o(i)),new l(t,r,e)}),n[m]("refresh"),this},disable:function(){return d._invoke.call(this,"disable")},enable:function(){return d._invoke.call(this,"enable")},destroy:function(){return d._invoke.call(this,"destroy")},prev:function(t,e){return d._traverse.call(this,t,e,function(t,e,n){return e>0?t.push(n[e-1]):void 0})},next:function(t,e){return d._traverse.call(this,t,e,function(t,e,n){return e<n.length-1?t.push(n[e+1]):void 0})},_traverse:function(t,e,i){var o,l;return null==t&&(t="vertical"),null==e&&(e=r),l=h.aggregate(e),o=[],this.each(function(){var e;return e=n.inArray(this,l[t]),i(o,e,l[t])}),this.pushStack(o)},_invoke:function(t){return this.each(function(){var e;return e=l.getWaypointsByElement(this),n.each(e,function(e,n){return n[t](),!0})}),this}},n.fn[g]=function(){var t,r;return r=arguments[0],t=2<=arguments.length?e.call(arguments,1):[],d[r]?d[r].apply(this,t):n.isFunction(r)?d.init.apply(this,arguments):n.isPlainObject(r)?d.init.apply(this,[null,r]):n.error(r?"The "+r+" method does not exist in jQuery Waypoints.":"jQuery Waypoints needs a callback function or handler option.")},n.fn[g].defaults={context:r,continuous:!0,enabled:!0,horizontal:!1,offset:0,triggerOnce:!1},h={refresh:function(){return n.each(a,function(t,e){return e.refresh()})},viewportHeight:function(){var t;return null!=(t=r.innerHeight)?t:i.height()},aggregate:function(t){var e,r,i;return e=s,t&&(e=null!=(i=a[n(t)[0][u]])?i.waypoints:void 0),e?(r={horizontal:[],vertical:[]},n.each(r,function(t,i){return n.each(e[t],function(t,e){return i.push(e)}),i.sort(function(t,e){return t.offset-e.offset}),r[t]=n.map(i,function(t){return t.element}),r[t]=n.unique(r[t])}),r):[]},above:function(t){return null==t&&(t=r),h._filter(t,"vertical",function(t,e){return e.offset<=t.oldScroll.y})},below:function(t){return null==t&&(t=r),h._filter(t,"vertical",function(t,e){return e.offset>t.oldScroll.y})},left:function(t){return null==t&&(t=r),h._filter(t,"horizontal",function(t,e){return e.offset<=t.oldScroll.x})},right:function(t){return null==t&&(t=r),h._filter(t,"horizontal",function(t,e){return e.offset>t.oldScroll.x})},enable:function(){return h._invoke("enable")},disable:function(){return h._invoke("disable")},destroy:function(){return h._invoke("destroy")},extendFn:function(t,e){return d[t]=e},_invoke:function(t){var e;return e=n.extend({},s.vertical,s.horizontal),n.each(e,function(e,n){return n[t](),!0})},_filter:function(t,e,r){var i,o;return(i=a[n(t)[0][u]])?(o=[],n.each(i.waypoints[e],function(t,e){return r(i,e)?o.push(e):void 0}),o.sort(function(t,e){return t.offset-e.offset}),n.map(o,function(t){return t.element})):[]}},n[m]=function(){var t,n;return n=arguments[0],t=2<=arguments.length?e.call(arguments,1):[],h[n]?h[n].apply(null,t):h.aggregate.call(null,n)},n[m].settings={resizeThrottle:100,scrollThrottle:30},i.load(function(){return n[m]("refresh")})})}).call(this);