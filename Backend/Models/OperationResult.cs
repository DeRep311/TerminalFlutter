

// modelo de dato para enviar las consultas al controller
public class OperationResult<T>
{
    public bool isSuccessful { get; set; }

    public T? data { get; set; }
    public String? message { get; set; }
}