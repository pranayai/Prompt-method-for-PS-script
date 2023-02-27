# Method to prompt user until a valid value is entered
# Params:
#   $userPrompt - User prompt string
#   #validator - Method that validates if the user entry is valid or not. "This method should return false if value has not passed the condition."

function GetInputTillValid
{
    param($userPrompt, [scriptblock]$validator)

    do
    {
        $res = Read-Host -Prompt $userPrompt
    } while(-not $validator.Invoke($res))

    return $res;
}


# Example to consume the method
# In below example, let us prompt user to enter a name which is not an empty string


function stringNotEmptyOrNull
{
    param($s)

    if($s.Trim() -ne "")
    {
        return $true
    }
    return $false
}

$res = GetInputTillValid -userPrompt "Please Enter your Name: " -validator { param($i) stringNotEmptyOrNull $i }

Write-Host "Value entered: $res"