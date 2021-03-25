using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$a = $Request.Query.a
$b = $Request.Query.b

if ( (-not $a) -and (-not $b) ) {
    $body = "You need to pass a 'a' and a 'b' parameter in the URL."
}
else {
    [int]$body = [int]$a * [int]$b
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
