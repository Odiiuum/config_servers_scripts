 for ($i = 41; $i -le 60; $i++) {
    $username = "work_user-"
    if ($i -lt 10) {
        $username += "0" + $i
    } else {
        $username += $i
    }

    $password = ConvertTo-SecureString -String "#PASSWORD" -AsPlainText -Force

    New-LocalUser -Name $username -Password $password -Description "Work User $i" -UserMayNotChangePassword

    Add-LocalGroupMember -Group "Remote Desktop Users" -Member $username	

    Add-LocalGroupMember -Group "Users" -Member $username
}

pause
