(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-08562011"],{"04e4":function(t,e,s){t.exports=s.p+"img/g3.50688ff2.webp"},2382:function(t,e,s){"use strict";s("910d")},"5ddf":function(t,e,s){},6033:function(t,e,s){},"79d9":function(t,e,s){"use strict";s("6033")},"910d":function(t,e,s){"use strict";var a=s("23e7"),o=s("c65b"),l=s("59ed"),r=s("825a"),i=s("46c4"),n=s("c5cc"),c=s("9bdd"),d=s("c430"),u=n((function(){var t,e,s,a=this.iterator,l=this.predicate,i=this.next;while(1){if(t=r(o(i,a)),e=this.done=!!t.done,e)return;if(s=t.value,c(a,l,[s,this.counter++],!0))return s}}));a({target:"Iterator",proto:!0,real:!0,forced:d},{filter:function(t){return r(this),l(t),new u(i(this),{predicate:t})}})},9974:function(t,e,s){"use strict";s("5ddf")},f74b:function(t,e,s){"use strict";s.r(e);var a=function(){var t=this,e=t._self._c;return e("el-container",{staticStyle:{"min-height":"100vh"}},[e("el-aside",{staticStyle:{"box-shadow":"2px 0 6px rgb(0 21 41 / 35%)"},attrs:{width:t.sideWidth+"px"}},[e("Aside",{staticStyle:{"padding-bottom":"20px"},attrs:{isCollapse:t.isCollapse,logoTextShow:t.logoTextShow}})],1),e("el-container",[e("el-header",{staticStyle:{"border-bottom":"1px solid #ccc"}},[e("Header",{attrs:{collapseBtnClass:t.collapseBtnClass,user:t.user},on:{asideCollapse:t.collapse}})],1),e("el-main",[e("router-view",{on:{refreshUser:t.getUser}})],1)],1)],1)},o=[],l=function(){var t=this,e=t._self._c;return e("el-menu",{staticStyle:{"min-height":"100%","overflow-x":"hidden"},attrs:{"default-openeds":t.opens,"background-color":"#6366f1","text-color":"#fff","active-text-color":"#f472b6","collapse-transition":!1,collapse:t.isCollapse,router:""}},[e("div",{staticClass:"logo-container"},[e("img",{staticClass:"logo-img",attrs:{src:s("04e4"),alt:""}}),e("b",{directives:[{name:"show",rawName:"v-show",value:t.logoTextShow,expression:"logoTextShow"}],staticClass:"logo-text"},[t._v("管 理")])]),t._l(t.filteredMenus,(function(s){return e("div",{key:s.id},[s.path?e("div",[e("el-menu-item",{staticClass:"menu-item",attrs:{index:s.path}},[e("i",{class:s.icon}),e("span",{attrs:{slot:"title"},slot:"title"},[t._v(t._s(s.name))])])],1):e("div",[e("el-submenu",{staticClass:"submenu",attrs:{index:s.id+""}},[e("template",{slot:"title"},[e("i",{class:s.icon}),e("span",{attrs:{slot:"title"},slot:"title"},[t._v(t._s(s.name))])]),t._l(s.children,(function(s){return e("div",{key:s.id},[e("el-menu-item",{staticClass:"menu-item",attrs:{index:s.path}},[e("i",{class:s.icon}),e("span",{attrs:{slot:"title"},slot:"title"},[t._v(t._s(s.name))])])],1)}))],2)],1)])}))],2)},r=[],i=(s("0643"),s("2382"),s("a573"),{name:"Aside",props:{isCollapse:{type:Boolean,default:!1},logoTextShow:{type:Boolean,default:!0}},data(){return{menus:localStorage.getItem("menus")?JSON.parse(localStorage.getItem("menus")):[],opens:localStorage.getItem("menus")?JSON.parse(localStorage.getItem("menus")).map(t=>t.id+""):[]}},mounted(){this.createStars()},methods:{createStars(){const t=document.querySelector(".el-menu");for(let e=0;e<20;e++){const e=document.createElement("div");e.className="star",e.style.left=100*Math.random()+"%",e.style.animationDelay=3*Math.random()+"s",t.appendChild(e)}}},computed:{filteredMenus(){return this.menus.filter(t=>![40,42,43,9].includes(t.id))}}}),n=i,c=(s("79d9"),s("2877")),d=Object(c["a"])(n,l,r,!1,null,null,null),u=d.exports,p=function(){var t=this,e=t._self._c;return e("div",{staticClass:"header-container"},[e("div",{staticClass:"header-left"},[e("span",{staticClass:"collapse-btn",class:t.collapseBtnClass,on:{click:t.collapse}}),e("el-breadcrumb",{staticClass:"breadcrumb",attrs:{separator:"/"}},[e("el-breadcrumb-item",{attrs:{to:"/"}},[t._v("首页")]),e("el-breadcrumb-item",[t._v(t._s(t.currentPathName))])],1)],1),e("el-dropdown",{staticClass:"user-dropdown"},[e("div",{staticClass:"avatar-container"},[e("img",{staticClass:"avatar",attrs:{src:t.user.avatarUrl,alt:""}}),e("span",{staticClass:"nickname"},[t._v(t._s(t.user.nickname))]),e("i",{staticClass:"el-icon-arrow-down"})]),e("el-dropdown-menu",{staticClass:"dropdown-menu",attrs:{slot:"dropdown"},slot:"dropdown"},[e("el-dropdown-item",[e("router-link",{attrs:{to:"/password"}},[t._v("修改密码")])],1),e("el-dropdown-item",[e("router-link",{attrs:{to:"/person"}},[t._v("个人信息")])],1),e("el-dropdown-item",[e("span",{on:{click:t.logout}},[t._v("退出")])])],1)],1)],1)},m=[],h={name:"Header",props:{collapseBtnClass:String,user:Object},computed:{currentPathName(){return this.$store.state.currentPathName}},data(){return{}},methods:{collapse(){this.$emit("asideCollapse")},logout(){this.$store.commit("logout"),this.$message.success("退出成功")}}},f=h,g=(s("9974"),Object(c["a"])(f,p,m,!1,null,"2812c89d",null)),v=g.exports,w={name:"Home",data(){return{collapseBtnClass:"el-icon-s-fold",isCollapse:!1,sideWidth:200,logoTextShow:!0,user:{}}},components:{Aside:u,Header:v},created(){this.getUser()},methods:{collapse(){this.isCollapse=!this.isCollapse,this.isCollapse?(this.sideWidth=64,this.collapseBtnClass="el-icon-s-unfold",this.logoTextShow=!1):(this.sideWidth=200,this.collapseBtnClass="el-icon-s-fold",this.logoTextShow=!0)},getUser(){let t=localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")).username:"";t&&this.request.get("/user/username/"+t).then(t=>{this.user=t.data})}}},C=w,b=Object(c["a"])(C,a,o,!1,null,null,null);e["default"]=b.exports}}]);
//# sourceMappingURL=chunk-08562011.9edb2a48.js.map