// Press F1 to get detailed help about Sonargraph's architecture DSL.
//
// To enable architecture checking on this file please right click on it in
// the architecture view or files view and select 'Add to Architecture Check'.
//
// The allowed dependencies (connect statements) are based on your workspace
// dependencies which can be visualized by opening the workspace dependencies
// view. If you get "Missing workspace dependency" warnings in the issues view you
// will also get architecture violations. To remedy this problem you have to add
// the allowed connections to the artifacts causing the violations. The best way
// to inspect architecture violations is to use the architecture view and select the
// architecture file of interest. You can also add the missing workspace dependencies
// in the workspace dependencies view and then re-generate this architecture.
//
// You can now enhance this initial architecture by fleshing out the internal structure of
// your modules. Please make sure to read our documentation about the architecture DSL (F1) so
// that you get a better idea how you can create a concise and elegant architectural blueprint
// for your application.

artifact ConfigsUser
{
    include "**/user/configs/**"
}
artifact ControllerUser
{
    include "**/user/controller/**"
    connect to ServiceUser
    connect to ModelUser
    connect to DtoUser
}
artifact ServiceUser
{
    include "**/user/service/**"
    connect to ProducerUser
    connect to RepositoryUser
    connect to ModelUser
}
artifact ProducerUser
{
    include "**/user/producer/**"
    connect to ModelUser
    connect to DtoUser
}
artifact ModelUser
{
    include "**/user/model/**"
}
artifact DtoUser
{
    include "**/user/dto/**"
}
artifact RepositoryUser
{
    include "**/user/repository/**"
    connect to ModelUser
}
///////
artifact ConfigsEmail
{
    include "**/email/configs/**"
}
artifact ConsumerEmail
{
    include "**/email/consumer/**"
    connect to DtoEmail
}
artifact DtoEmail
{
    include "**/email/dtos/**"
}