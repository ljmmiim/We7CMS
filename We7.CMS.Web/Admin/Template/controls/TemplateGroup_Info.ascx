<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TemplateGroup_Info.ascx.cs"
    Inherits="We7.CMS.Web.Admin.TemplateGroup_Info" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls"
    TagPrefix="WEC" %>
    <script type="text/javascript" src="/scripts/we7/we7.loader.js">
        $(document).ready(function () {
            we7("#form-region").attachValidator({
                inputEvent: 'blur',
                errorInputEvent:null
		    });
        });
    </script>
    <script type="text/javascript">
        function SaveButtonClick() {
            var submitBtn = document.getElementById("<%=SaveButton.ClientID %>");
            var div = $("#form-region");
            var enable = we7(div).validate();
            if (enable) {
                submitBtn.click();
            }
        }

        function Register() {
            parent.UxEvents.reload = 1;
        }
    </script>
<div>
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
    <table id="form-region">
        <tr>
            <th style="width: 20%">
                项目
            </th>
            <th style="width: 443px">
                内容
            </th>
        </tr>
        <tr>
            <td>
                名称：
            </td>
            <td style="width: 443px">
                <asp:TextBox ID="NameTextBox" runat="server" Text="" Columns="50" MaxLength="64" CssClass="required"
                     required="required" pattern="[a-zA-Z0-9_]+" errmsg="模型配置文件名称，请使用英文字母数字和下划线" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <span class="note">模板组名称只能为英文字母数字和下划线，一旦保存将不能再更改。 </span>
            </td>
        </tr>
        <tr>
            <tr>
                <td>
                    描述：
                </td>
                <td style="width: 443px">
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text="" TextMode="MultiLine"
                        Columns="40" Rows="5"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    日期：
                </td>
                <td style="width: 443px">
                    <asp:Label ID="CreatedLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    上传预览图：
                </td>
                <td style="width: 443px">
                    <asp:FileUpload ID="PreviewFileUploador" runat="server" Style="position: relative" />
                    <asp:Panel ID="MessagePanel" runat="server" Style="position: relative" Visible="false">
                        <asp:Image ID="MessageImage" runat="server" ImageUrl="~/admin/Images/icon_warning.gif" />
                        <asp:Label ID="MessageLabel" runat="server" Text="预览效果图片的格式为jpg文件."></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    版本号：
                </td>
                <td style="width: 443px">
                    <%= productVersion %>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td class="toolbar">
                    <br />
                    <li class="smallButton4">
                        <asp:HyperLink ID="SaveHyperLink" NavigateUrl="javascript:SaveButtonClick();" runat="server">保  存</asp:HyperLink></li>
                </td>
            </tr>
    </table>
</div>
<div style="display: none">
    <asp:TextBox ID="FileTextBox" runat="server"></asp:TextBox>
    <asp:TextBox ID="TemplateTextBox" runat="server"></asp:TextBox>
    <asp:TextBox ID="DetailTemplateTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
</div>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" />

