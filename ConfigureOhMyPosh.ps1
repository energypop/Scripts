# Installation of omp

winget install JanDeDobbeleer.OhMyPosh -s winget 

if ($?){ # $? is a default variable and it will be used to check if the command has run sucessfully 
    $env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"
    Write-Output "Oh My Posh has been installed"
    continue 
}
else {
    Write-Output "Couldn't get OhMyPosh from winget. Installing and using scoop instead..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    Start-Process scoop -ArgumentList "install git" -Wait 
    Start-Process scoop -ArgumentList "scoop bucket add extras" -Wait
    Start-Process scoop -ArgumentList "scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json" -Wait  
    continue
}

# Oh my posh is already installed using winget or scoop 

