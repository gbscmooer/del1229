(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-bf062892"],{"026b":function(e,t,l){"use strict";l("fccf")},1511:function(e,t,l){"use strict";l.r(t);var s=function(){var e=this,t=e._self._c;return t("div",[t("div",{staticStyle:{margin:"10px 0"}},[t("el-input",{staticStyle:{width:"200px"},attrs:{placeholder:"请输入名称","suffix-icon":"el-icon-search"},model:{value:e.username,callback:function(t){e.username=t},expression:"username"}}),t("el-input",{staticClass:"ml-5",staticStyle:{width:"200px"},attrs:{placeholder:"请输入邮箱","suffix-icon":"el-icon-message"},model:{value:e.email,callback:function(t){e.email=t},expression:"email"}}),t("el-input",{staticClass:"ml-5",staticStyle:{width:"200px"},attrs:{placeholder:"请输入地址","suffix-icon":"el-icon-position"},model:{value:e.address,callback:function(t){e.address=t},expression:"address"}}),t("el-button",{staticClass:"ml-5",attrs:{type:"primary"},on:{click:e.load}},[e._v("搜索")]),t("el-button",{attrs:{type:"warning"},on:{click:e.reset}},[e._v("重置")])],1),t("div",{staticStyle:{margin:"10px 0"}},[t("el-button",{attrs:{type:"primary"},on:{click:e.handleAdd}},[e._v("新增 "),t("i",{staticClass:"el-icon-circle-plus-outline"})]),t("el-popconfirm",{staticClass:"ml-5",attrs:{"confirm-button-text":"确定","cancel-button-text":"我再想想",icon:"el-icon-info","icon-color":"red",title:"您确定批量删除这些数据吗？"},on:{confirm:e.delBatch}},[t("el-button",{attrs:{slot:"reference",type:"danger"},slot:"reference"},[e._v("批量删除 "),t("i",{staticClass:"el-icon-remove-outline"})])],1),t("el-upload",{staticStyle:{display:"inline-block"},attrs:{action:"http://"+e.serverIp+":9090/user/import","show-file-list":!1,accept:"xlsx","on-success":e.handleExcelImportSuccess}},[t("el-button",{staticClass:"ml-5",attrs:{type:"primary"}},[e._v("导入 "),t("i",{staticClass:"el-icon-bottom"})])],1),t("el-button",{staticClass:"ml-5",attrs:{type:"primary"},on:{click:e.exp}},[e._v("导出 "),t("i",{staticClass:"el-icon-top"})])],1),t("el-table",{attrs:{data:e.tableData,border:"",stripe:"","header-cell-class-name":"headerBg"},on:{"selection-change":e.handleSelectionChange}},[t("el-table-column",{attrs:{type:"selection",width:"55"}}),t("el-table-column",{attrs:{prop:"id",label:"ID",width:"80"}}),t("el-table-column",{attrs:{prop:"username",label:"用户名",width:"140"}}),t("el-table-column",{attrs:{prop:"role",label:"角色"},scopedSlots:e._u([{key:"default",fn:function(l){return["ROLE_ADMIN"===l.row.role?t("el-tag",{attrs:{type:"primary"}},[e._v("管理员")]):e._e(),"ROLE_TEACHER"===l.row.role?t("el-tag",{attrs:{type:"warning"}},[e._v("研究员")]):e._e(),"ROLE_STUDENT"===l.row.role?t("el-tag",{attrs:{type:"success"}},[e._v("访客")]):e._e()]}}])}),t("el-table-column",{attrs:{prop:"nickname",label:"昵称",width:"120"}}),t("el-table-column",{attrs:{prop:"email",label:"邮箱"}}),t("el-table-column",{attrs:{prop:"phone",label:"电话"}}),t("el-table-column",{attrs:{prop:"address",label:"地址"}}),t("el-table-column",{attrs:{label:"操作",width:"500",align:"center"},scopedSlots:e._u([{key:"default",fn:function(l){return["ROLE_TEACHER"===l.row.role?t("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.lookCourse(l.row.courses)}}},[e._v("查看主持项目 "),t("i",{staticClass:"el-icon-document"})]):e._e(),"ROLE_STUDENT"===l.row.role?t("el-button",{attrs:{type:"warning"},on:{click:function(t){return e.lookStuCourse(l.row.stuCourses)}}},[e._v("查看已选项目 "),t("i",{staticClass:"el-icon-document"})]):e._e(),t("el-button",{attrs:{type:"success"},on:{click:function(t){return e.handleEdit(l.row)}}},[e._v("编辑 "),t("i",{staticClass:"el-icon-edit"})]),t("el-popconfirm",{staticClass:"ml-5",attrs:{"confirm-button-text":"确定","cancel-button-text":"我再想想",icon:"el-icon-info","icon-color":"red",title:"您确定删除吗？"},on:{confirm:function(t){return e.del(l.row.id)}}},[t("el-button",{attrs:{slot:"reference",type:"danger"},slot:"reference"},[e._v("删除 "),t("i",{staticClass:"el-icon-remove-outline"})])],1)]}}])})],1),t("div",{staticStyle:{padding:"10px 0"}},[t("el-pagination",{attrs:{"current-page":e.pageNum,"page-sizes":[2,5,10,20],"page-size":e.pageSize,layout:"total, sizes, prev, pager, next, jumper",total:e.total},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}})],1),t("el-dialog",{attrs:{title:"用户信息",visible:e.dialogFormVisible,width:"30%"},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[t("el-form",{attrs:{"label-width":"80px",size:"small"}},[t("el-form-item",{attrs:{label:"用户名"}},[t("el-input",{attrs:{autocomplete:"off"},model:{value:e.form.username,callback:function(t){e.$set(e.form,"username",t)},expression:"form.username"}})],1),t("el-form-item",{attrs:{label:"角色"}},[t("el-select",{staticStyle:{width:"100%"},attrs:{clearable:"",placeholder:"请选择角色"},model:{value:e.form.role,callback:function(t){e.$set(e.form,"role",t)},expression:"form.role"}},e._l(e.roles,(function(e){return t("el-option",{key:e.name,attrs:{label:e.name,value:e.flag}})})),1)],1),t("el-form-item",{attrs:{label:"昵称"}},[t("el-input",{attrs:{autocomplete:"off"},model:{value:e.form.nickname,callback:function(t){e.$set(e.form,"nickname",t)},expression:"form.nickname"}})],1),t("el-form-item",{attrs:{label:"邮箱"}},[t("el-input",{attrs:{autocomplete:"off"},model:{value:e.form.email,callback:function(t){e.$set(e.form,"email",t)},expression:"form.email"}})],1),t("el-form-item",{attrs:{label:"电话"}},[t("el-input",{attrs:{autocomplete:"off"},model:{value:e.form.phone,callback:function(t){e.$set(e.form,"phone",t)},expression:"form.phone"}})],1),t("el-form-item",{attrs:{label:"地址"}},[t("el-input",{attrs:{autocomplete:"off"},model:{value:e.form.address,callback:function(t){e.$set(e.form,"address",t)},expression:"form.address"}})],1)],1),t("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{on:{click:function(t){e.dialogFormVisible=!1}}},[e._v("取 消")]),t("el-button",{attrs:{type:"primary"},on:{click:e.save}},[e._v("确 定")])],1)],1),t("el-dialog",{attrs:{title:"项目信息",visible:e.vis,width:"30%"},on:{"update:visible":function(t){e.vis=t}}},[t("el-table",{attrs:{data:e.courses,border:"",stripe:""}},[t("el-table-column",{attrs:{prop:"name",label:"项目名称"}})],1)],1),t("el-dialog",{attrs:{title:"项目信息",visible:e.stuVis,width:"30%"},on:{"update:visible":function(t){e.stuVis=t}}},[t("el-table",{attrs:{data:e.stuCourses,border:"",stripe:""}},[t("el-table-column",{attrs:{prop:"name",label:"项目名称"}})],1)],1)],1)},a=[],o=(l("a573"),l("863e")),i={name:"User",data(){return{serverIp:o["a"],tableData:[],total:0,pageNum:1,pageSize:10,username:"",email:"",address:"",form:{},dialogFormVisible:!1,multipleSelection:[],roles:[],courses:[],vis:!1,stuCourses:[],stuVis:!1}},created(){this.load()},methods:{lookCourse(e){this.courses=e,this.vis=!0},lookStuCourse(e){this.stuCourses=e,this.stuVis=!0},load(){this.request.get("/user/page",{params:{pageNum:this.pageNum,pageSize:this.pageSize,username:this.username,email:this.email,address:this.address}}).then(e=>{this.tableData=e.data.records,this.total=e.data.total}),this.request.get("/role").then(e=>{this.roles=e.data})},save(){this.request.post("/user",this.form).then(e=>{"200"===e.code?(this.$message.success("保存成功"),this.dialogFormVisible=!1,this.load()):this.$message.error("保存失败")})},handleAdd(){this.dialogFormVisible=!0,this.form={}},handleEdit(e){this.form=JSON.parse(JSON.stringify(e)),this.dialogFormVisible=!0},del(e){this.request.delete("/user/"+e).then(e=>{"200"===e.code?(this.$message.success("删除成功"),this.load()):this.$message.error("删除失败")})},handleSelectionChange(e){console.log(e),this.multipleSelection=e},delBatch(){let e=this.multipleSelection.map(e=>e.id);this.request.post("/user/del/batch",e).then(e=>{"200"===e.code?(this.$message.success("批量删除成功"),this.load()):this.$message.error("批量删除失败")})},reset(){this.username="",this.email="",this.address="",this.load()},handleSizeChange(e){console.log(e),this.pageSize=e,this.load()},handleCurrentChange(e){console.log(e),this.pageNum=e,this.load()},exp(){window.open(`http://${o["a"]}:9090/user/export`)},handleExcelImportSuccess(){this.$message.success("导入成功"),this.load()}}},r=i,n=(l("026b"),l("2877")),c=Object(n["a"])(r,s,a,!1,null,null,null);t["default"]=c.exports},fccf:function(e,t,l){}}]);
//# sourceMappingURL=chunk-bf062892.ae1c2af2.js.map