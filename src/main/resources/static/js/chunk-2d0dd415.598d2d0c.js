(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d0dd415"],{8139:function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t._self._c;return e("div",{staticStyle:{color:"#666"}},[e("div",{staticStyle:{margin:"20px 0"}},[e("div",{staticClass:"pd-10",staticStyle:{"font-size":"20px",color:"#3F5EFB",cursor:"pointer"}},[t._v(t._s(t.article.name))]),e("div",{staticStyle:{"font-size":"14px","margin-top":"10px"}},[e("i",{staticClass:"el-icon-user-solid"}),t._v(" "),e("span",[t._v(t._s(t.article.user))]),e("i",{staticClass:"el-icon-time",staticStyle:{"margin-left":"10px"}}),t._v(" "),e("span",[t._v(t._s(t.article.time))])])]),e("div",{staticStyle:{margin:"20px 0"}},[e("mavon-editor",{staticClass:"md",attrs:{value:t.article.content,subfield:!1,defaultOpen:"preview",toolbarsFlag:!1,editable:!1,scrollStyle:!0,ishljs:!0}})],1),e("div",{staticStyle:{margin:"30px 0"}},[e("div",{staticStyle:{margin:"10px 0"}},[e("div",{staticStyle:{"border-bottom":"1px solid orangered",padding:"10px 0","font-size":"20px"}},[t._v("评论")]),e("div",{staticStyle:{padding:"10px 0"}},[e("el-input",{attrs:{size:"small",type:"textarea"},model:{value:t.commentForm.content,callback:function(e){t.$set(t.commentForm,"content",e)},expression:"commentForm.content"}})],1),e("div",{staticClass:"pd-10",staticStyle:{"text-align":"right"}},[e("el-button",{attrs:{type:"primary",size:"small"},on:{click:t.save}},[t._v("评论")])],1)]),e("div",t._l(t.comments,(function(i){return e("div",{key:i.id,staticStyle:{"border-bottom":"1px solid #ccc",padding:"10px 0"}},[e("div",{staticStyle:{display:"flex"}},[e("div",{staticStyle:{width:"100px","text-align":"center"}},[e("el-image",{staticStyle:{width:"50px",height:"50px","border-radius":"50%"},attrs:{src:i.avatarUrl}})],1),t._v(" "),e("div",{staticStyle:{flex:"1","font-size":"14px",padding:"5px 0","line-height":"25px"}},[e("b",[t._v(t._s(i.nickname)+"：")]),e("span",[t._v(t._s(i.content))]),e("div",{staticStyle:{display:"flex","line-height":"20px","margin-top":"5px"}},[e("div",{staticStyle:{width:"200px"}},[e("i",{staticClass:"el-icon-time"}),e("span",{staticStyle:{"margin-left":"5px"}},[t._v(t._s(i.time))])]),e("div",{staticStyle:{"text-align":"right",flex:"1"}},[e("el-button",{staticStyle:{"margin-left":"5px"},attrs:{type:"text"},on:{click:function(e){return t.handleReply(i.id)}}},[t._v("回复")]),t.user.id===i.userId?e("el-button",{staticStyle:{color:"red"},attrs:{type:"text"},on:{click:function(e){return t.del(i.id)}}},[t._v("删除")]):t._e()],1)])])]),i.children.length?e("div",{staticStyle:{"padding-left":"200px"}},t._l(i.children,(function(i){return e("div",{key:i.id,staticStyle:{"background-color":"#f0f0f0",padding:"5px 20px"}},[e("div",{staticStyle:{"font-size":"14px",padding:"5px 0","line-height":"25px"}},[e("div",[i.pnickname?e("b",{staticStyle:{color:"#3a8ee6"}},[t._v("@"+t._s(i.pnickname))]):t._e()]),e("div",{staticStyle:{"padding-left":"5px"}},[e("b",[t._v(t._s(i.nickname)+"：")]),e("span",[t._v(t._s(i.content))])]),e("div",{staticStyle:{display:"flex","line-height":"20px","margin-top":"5px","padding-left":"5px"}},[e("div",{staticStyle:{width:"200px"}},[e("i",{staticClass:"el-icon-time"}),e("span",{staticStyle:{"margin-left":"5px"}},[t._v(t._s(i.time))])]),e("div",{staticStyle:{"text-align":"right",flex:"1"}},[e("el-button",{staticStyle:{"margin-left":"5px"},attrs:{type:"text"},on:{click:function(e){return t.handleReply(i.id)}}},[t._v("回复")]),t.user.id===i.userId?e("el-button",{staticStyle:{color:"red"},attrs:{type:"text"},on:{click:function(e){return t.del(i.id)}}},[t._v("删除")]):t._e()],1)])])])})),0):t._e()])})),0)]),e("el-dialog",{attrs:{title:"回复",visible:t.dialogFormVisible,width:"50%"},on:{"update:visible":function(e){t.dialogFormVisible=e}}},[e("el-form",{attrs:{"label-width":"80px",size:"small"}},[e("el-form-item",{attrs:{label:"回复内容"}},[e("el-input",{attrs:{type:"textarea",autocomplete:"off"},model:{value:t.commentForm.contentReply,callback:function(e){t.$set(t.commentForm,"contentReply",e)},expression:"commentForm.contentReply"}})],1)],1),e("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[e("el-button",{attrs:{size:"small"},on:{click:function(e){t.dialogFormVisible=!1}}},[t._v("取 消")]),e("el-button",{attrs:{type:"primary",size:"small"},on:{click:t.save}},[t._v("确 定")])],1)],1)],1)},l=[],a={name:"Article",data(){return{article:{},user:localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):{},comments:[],commentForm:{},id:this.$route.query.id,dialogFormVisible:!1}},created(){this.load(),this.loadComment()},methods:{load(){this.request.get("/article/"+this.id).then(t=>{this.article=t.data})},loadComment(){this.request.get("/comment/tree/"+this.id).then(t=>{this.comments=t.data})},save(){this.user.id?(this.commentForm.articleId=this.id,this.commentForm.contentReply&&(this.commentForm.content=this.commentForm.contentReply),this.request.post("/comment",this.commentForm).then(t=>{"200"===t.code?(this.$message.success("评论成功"),this.commentForm={},this.loadComment(),this.dialogFormVisible=!1):this.$message.error(t.msg)})):this.$message.warning("请登录后操作")},del(t){this.request.delete("/comment/"+t).then(t=>{"200"===t.code?(this.$message.success("删除成功"),this.loadComment()):this.$message.error("删除失败")})},handleReply(t){this.commentForm={pid:t},this.dialogFormVisible=!0}}},n=a,o=i("2877"),c=Object(o["a"])(n,s,l,!1,null,"3c2f6cb1",null);e["default"]=c.exports}}]);
//# sourceMappingURL=chunk-2d0dd415.598d2d0c.js.map