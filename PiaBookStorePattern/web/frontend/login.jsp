<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table cellpadding="0" cellspacing="0" border="0">
    <form method="post" action="UserController?action=login">
        <div class="form-group">
            <label><strong>Tài khoản: </strong></label>
            <input required type="text" class="form-control" name="username" />
        </div>
        <div class="form-group">
            <label ><strong>Mật khẩu: </strong></label>
            <input required type="password" class="form-control" name="password" />
        </div>
        <button class="btn btn-primary" type="submit"> Đăng nhập </button>
        <div class="clear"></div>
    </form>
</table>