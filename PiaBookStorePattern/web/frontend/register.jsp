<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table cellpadding="0" cellspacing="0" border="0">
    <form name="register" method="post" action="UserController?action=register">          
        <div class="form_row">
            <label class="form-group"><strong>Username: </strong></label>
            <input required type="text" class="form-control" pattern="[A-Za-z0-9]+" name="username" />
        </div>  
        <br>
        <div class="form_row">
            <label class="form-group"><strong>Password: </strong></label>
            <input required type="password" class="form-control" name="password" />
        </div> 
        <br>
        <div class="form_row">
            <label class="form-group"><strong>Email:</strong></label>
            <input required type="email" class="form-control" name="email"/>
        </div>
        <br>
        <div class="form_row">
            <label class="form-group"><strong>Fullname: </strong></label>
            <br>
            <input required type="text" name="firstname" style="display: inline; width: 30%" class="form-control"/>
            <input required type="text" name="midname" style="display: inline; width: 30%" class="form-control"/>
            <input required type="text" name="lastname" style="display: inline; width: 30%" class="form-control"/>
        </div>
        <br>
        <div class="form_row">
            <label class="form-group"><strong>Gender</strong></label>
            <select name="gender" class="form-control">
                <option value="1">Nam</option>
                <option value="2">Nử</option>
            </select>
        </div>
        <br>
        <div class="form_row" style="float:right;margin-right:20px">
            <label>DOB</label>
            <input type="text" name="day" style="display: inline; width: 20%" class="form-control"/>
            <label>Month</label>
            <select name="month" style="display: inline; width: 20%" class="form-control">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
            <label><strong>Year</strong></label>
            <input required style="display: inline; width: 20%" class="form-control" type="text" name="year" size="20" />
        </div>
        <br>
        <div class="form_row">
            <label class="form-group"><strong>No</strong></label>
            <input required type="text" name="house_no" class="form-control"/>
        </div>
        <br>
        <div class="form_row">
            <label class="form-group"><strong>District: </strong></label>
            <input required type="text" name="district" class="form-control"/>
        </div>
        <br>
        <div class="form_row">
            <label class="form-group"><strong>Town: </strong></label>
            <input required type="text" name="town" class="form-control"/>
        </div>
        <br>
        <div class="form_row">
            <label class="form-group"><strong>City: </strong></label>
            <input required type="text" name="city" class="form-control"/>
        </div>
        <br/>
        <div class="form_row">
            <button class="btn btn-success">Register</button>
        </div>   
    </form>   
</table>