# Azure Functions

Azure Functions is a serverless solution that allows you to write less code, maintain less infrastructure, and save on costs. Instead of worrying about deploying and maintaining servers, the cloud infrastructure provides all the up-to-date resources needed to keep your applications running.

Azure Functions is a cloud-based compute service. Functions provide event-driven and scalable serverless compute for Azure. In some cases, you’re only billed for the time your function code runs.

You can use Azure Functions to run your code when you need it to run. For example, your code can run as the result of an event or change, such as when a message arrives in a queue or when a stored object is updated. You can also use CRON rules to define a scheduled interval for your code to run.

## Use triggers to decide when to run code

Azure Functions lets you define triggers, which start the execution of your code. Triggers can also process inputs for passing data into your functions. Each function can have only one trigger. Some of the trigger types supported by Azure functions include:

Storage: you can listen from events from databases like Azure Cosmos DB when a new row is inserted for example.
Events: Event Grid and Event Hubs produce events that can trigger your code.
HTTP, code can be triggered by Web requests and Web Hooks
Queues, queue messages can be process as well.
Timer, code can be invoked with a certain time interval.
Use bindings to connect to data sources. Bindings are ways to simplify coding for input and output data. While you can use client SDKs to connect to services from your function code, Functions provide bindings to simplify these connections. Essentially bindings are connection code you don’t have to write. You can integrate with many services on Azure and solve integration problems and automate business processes.

Bindings comes in two flavors, input, and output. An output binding provides a way to write data to the data source, for example, place a message on a queue or a new row in a database. Input bindings can be used to pass data to your function from a data source different than the one that triggered the function.

## Features of Functions:

- Flexible hosting plans. There are three different hosting plans to fit your business needs.

    - Consumption plan. This is the fully serverless hosting option for Functions. Functions scale automatically, and you pay for compute resources only when your functions are running. This plan provides cost-efficient compute for short process workloads that tend to be more intermittent with less-predictable loads.
    - Premium plan. In this plan, your functions are kept initialized, meaning there’s no delay after being idle. This is a good plan to choose when your function app needs to run for longer periods, but you still need the dynamic scale. This plan also lets you start scaling with more resources faster than with the Consumption plan. In the Consumption plan there’s also limits on the execution time, which this plan can supersede. While you still get the cost benefits of dynamic scale, you pay more
    - Dedicated plan. You run your functions with a regular App Service plan. It’s best for scenarios where your functions need to run continuously. Another benefit is that you fully control how the app scales and can more easily predict costs. This is also a good choice when you have an existing but underutilized App Service plan available.

    ![Plans](/00_includes/Cloud/Week3/FunctionPlans.png)

    - Always on:

    If you run on a Dedicated plan, you should enable the Always on setting so that your function app runs correctly. On an App Service plan, the functions runtime goes idle after a few minutes of inactivity, so only HTTP triggers will "wake up" your functions. Always on is available only on an App Service plan. On a Consumption plan, the platform activates function apps automatically.
    
- Dynamic scaling. In most plans, functions are dynamically scaled based on load. When demand of execution increases, more resources are allocated automatically to the service and when requests fall, resources and application instances drop off automatically. In Consumption plan, you don’t pay at all for idle functions.

- Event based architecture. Functions are meant to be small and focused and process incoming data and be done or raise a new event in turn. Some common usage areas of Azure functions are sending emails, starting backup, order processing, task scheduling such as database clean-up, sending notifications, messages, and IoT data processing.




## Storage account requirements

On any plan, a function app requires a general Azure Storage account, which supports Azure Blob, Queue, Files, and Table storage. This is because Functions rely on Azure Storage for operations such as managing triggers and logging function executions, but some storage accounts don't support queues and tables. These accounts, which include blob-only storage accounts (including premium storage) and general-purpose storage accounts with zone-redundant storage replication, are filtered-out from your existing Storage Account selections when you create a function app.

# Event Grid 

Event Grid is a highly scalable, serverless event broker that you can use to integrate applications using events. Events are delivered by Event Grid to subscriber destinations such as applications, Azure services, or any endpoint to which Event Grid has network access. The source of those events can be other applications, SaaS services and Azure services.

![Eventgrid](/00_includes/Cloud/Week3/eventgrid-functional-model.png)

## Event Sources
1. Your own service or solution that publishes events to Event Grid so that your customers can subscribe to them.
    Custom Topics(Topics) or Domains
2. A SaaS provider or platform can publish their events to Event Grid through a feature called Partner Events. 
3. An Azure service.

## Concepts

- Events - What happened.
- Event sources - Where the event took place.
- Topics - The endpoint where publishers send events.
- Event subscriptions - The endpoint or built-in mechanism to route events, sometimes to more than one handler. Subscriptions are also used by handlers to intelligently filter incoming events.
- Event handlers - The app or service reacting to the event.

## Characteristics of Event Grid

It has the following characteristics:

    - Dynamically scalable
    - Low cost
    - Serverless
    - At least once delivery of an event

# Azure Service Bus


## Key Terminologies



## Exercise 1

- Create function App with a function
- Create a blob storage and when a blob is uploaded trigger an event 
- Event grid trigger created and event subscription added to Strorage
- When a file is uploaded to the blob storage you can check the Event notification monitor for the event trigger. 

### Sources

* [Azure Function training](https://learn.microsoft.com/en-us/training/modules/explore-azure-functions/)

* [Azure Function training 2](https://learn.microsoft.com/en-us/training/modules/intro-azure-functions/)
* [ Function demo](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-csharp?tabs=in-process)
* [EventGrid](https://learn.microsoft.com/en-us/azure/event-grid/overview?WT.mc_id=AZ-MVP-5003556)
* [Compare messaging services](https://learn.microsoft.com/en-us/azure/event-grid/compare-messaging-services)
* [Video of Function & Event grid demo](https://www.youtube.com/watch?v=W1QFS-_HnsA)


### Overcome challenges



### Results


Function App creation

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/FuncAppCreation.png)

Create function in the function app

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/CreateFunction.png)

Event Grid Trigger created

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/EventgridTriggerCreated.png)

Create a storage account

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/StorageAccountcreation.png)

Create a Even subscription

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/EventSubscription1.png)

End point selected as the Azure Function

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/EventSubscription2.png)

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/EventSubscription3.png)

Event Subscription created

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/EventSubscriptioncreated.png)

Upload an image which will trigger an event

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/UploadanImageinContainer.png)

Event  notification in the monitor can be seen below

![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/EventNotificationinMonitor.png)


![Function](/00_includes/Cloud/Week3/Function%2BEventgrid/Code%2Btest.png)
