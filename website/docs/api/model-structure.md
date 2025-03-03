---
id: model-structure
title: GEMMA Model Structure
sidebar_label: Model Structure
---

# GEMMA Architecture Model Structure

The GEMMA API provides access to a comprehensive architecture model that follows the ArchiMate standard. This page explains the structure of the model and the relationships between its components.

## Core Components

The GEMMA architecture model consists of several core components:

### Model

The top-level container that holds all architecture elements, relations, views, and property definitions. Each model represents a complete architecture framework.

### Elements

ArchiMate elements represent the building blocks of the architecture. These can be:
- Business elements (actors, processes, functions)
- Application elements (components, services)
- Technology elements (infrastructure, devices)
- Motivation elements (goals, principles)

Each element has a type, name, documentation, and custom properties.

### Relations

Relations define how elements are connected to each other. Examples include:
- Composition (element consists of other elements)
- Aggregation (element contains other elements)
- Assignment (element is assigned to another element)
- Realization (element realizes another element)
- Used By (element is used by another element)

### Views

Views provide different perspectives on the architecture model. Each view focuses on specific aspects of the architecture and contains visual representations of elements and their relationships.

### Property Definitions

Property definitions specify the custom properties that can be associated with elements and relations. Each property has a type, description, and applicable elements.

## Visualization Components

The model includes components for visualizing the architecture:

### Nodes

Nodes represent elements in a visual diagram. Each node has a position, style, and can contain child nodes.

### Connections

Connections represent relations in a visual diagram. Each connection links two nodes and has styling properties.

## Object Diagram

The following diagram shows the structure of the GEMMA architecture model and the relationships between its components:

![GEMMA Architecture Model Structure](/Softwarecatalogus/img/gemma-model.png)

## API Access

You can access these components through the GEMMA API:

- `/model` - Get the complete architecture model
- `/elements` - Get all architecture elements
- `/relations` - Get all relations between elements
- `/views` - Get all architecture views
- `/propertydefinitions` - Get all property definitions

For detailed API documentation, see the [API Specification](/api). 